
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Papa Lips"
composer = #"Bob Mintzer"
meter = #"(Calypso)"
kwtempo = #"Fast"
kwstyle = #"Calypso"


realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Bob Mintzer" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=TvttpBrD4Cg"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
             \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  }
}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on the 1st 8 bars of A and all C then D.S. al Coda" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  bes2:13 as:13 g:7 des:9.11+ c1:9 f2:7 es:13
  d1:8 g:8 c:9 es/f
  bes2:13 as:13 g:7 des:9.11+ c1:9 f:9sus4
  as:13 g:8 des2:m7 ges:13 c:m7 f:13
  bes2:13 as:13 g:7 des:9.11+ c1:9 f:9sus4
  bes:m17 es:13 d:8 g:8 
  c:9 f:9sus4 ges:13 f:13 c:9 f:9sus4 f:m11 bes4.:13sus4 bes:13 s4
  es1*2:7+9 c:m11 d1:8 g:8 c:8 f:9sus4 as1*2:13sus4 as:9-11+13 
  des1:7+9/as a:6.9/as des:7+9/as f:8
   bes2:13 as:13 g:7 des:9.11+ c1:9 f:9sus4
  bes:m17 es:13 d:8 g:8 
  c:9 f:9sus4 d:8 g:8 c:9 f:9sus4 d:8 g:8 c:9 f:9sus4 
  s4 f2.:1 s2 f:9sus4
  c2:m7 d:m5-7 g:8 e:9+ es:7+9 des:8 d:m11 e:5+7
  a:m7 d:8 as1:13/d d:8 s2. g4:5.9/b c2:m11 f4.:1 bes8:1
}

theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \mark \markup \bold \box \fontsize #0 Intro
  \comp #28 | r8 \improvisationOn b8-.4 2 \improvisationOff \break \A
  \repeat volta 2 { 
    \scoop d4 r r2 | r4. g,8 bes4-. 4-- | \scoop d4  r r2 | r r4 bes-. |
    f'4 es8 d r c4-. bes8~ | 4. g8 bes4-. bes-. | 
    es4. as8-. es-. d-. as4-- | r8 f'-. d-. a!-. g4 \acciaccatura {as16 g} f4-. | \break
    \scoop d'4 r r2 | r4. g,8 bes4-. 4-- | \scoop d4  r r2 | r bes4-. bes-. |
    as'2 r8 bes4-. g8 | r es4-. 8 r2 | 
    r4. a8-^ r fes es des | es4-- des-. bes4. \scoop d8 \break 
  }
  \alternative {
    { R1 | r2 r8 f g bes~ | 4 as8 fes es des bes des | 
      d!4-. 8 f g4 \acciaccatura {as16 g} f4-. }
    { R1 | r4 r8 g, bes4-. 4~ | 1~ | 4. 8-^ r8 bes4.-> }
  }
  \once \override Score.RehearsalMark.extra-offset = #'(-4 . -3)
  \BetS \break 
  f'4-^ r r2 | f4 es8 d r bes4-. f'8 | R1 | f4 es8 d r bes4. |
  \stemDown f'4-^ r r es8 f | a bes f f~ f des es bes | 
  8 des as ges bes des bes4 | r4. d8 r f4.-> \break
  as4-^ r r2 | c4-. as-. bes \acciaccatura {c16 bes} a4 |  R1 | r2 as4. f8 | 
  es4. f8~ 4 as,~ | 2. des4-. | es2~ 8 des es f | r2 as,4-. bes-. | \break
  \C \scoop d4 r r2 | r4. g,8 bes4-. 4-- | \scoop d4  r r2 | r4. bes8 r bes4. |
  as'2 r8 bes4-. g8 | r es4-. 8 r2 | 
  r4. a8-^ r fes es des | es4-- des-. bes4. \scoop d8 \break 
  R1 | r2 bes4-. 4-. | \scoop f' r4 4. bes,8 \bendAfter #-5 | r2 bes4-. 4-. |
  | \scoop f' r4 4. bes,8 \bendAfter #-5 | r2 bes4-. 8 8 | 
  bes'4-^ r r4. bes,8 \bendAfter #-5 | r4. g8 bes4-. 4-. |
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \Coda \break
  | \scoop f' r4 4. d,8~ | d f g f bes4-. 4~ | 1 | R \bar "|." \break
  \Coda es2 d bes g' f a g e | \noBreak
  c4-^ r8 c'->~ 2~ | 1 | c,~ | 2 r8 g'4.-^ | f2 4. b8-^ \bar ".."
  

  
}

chordsRhythm = \relative c' {
\override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
  \stemUp
   s1*32  d1 ~ 1 1 ~ 1 1 2.. 8~ | 1 | 4. 8 r8 4.
   1 ~ 1 1 ~ 1 1 1 1 r8 8 r4 4 4
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \key bes \major \time 4/4
  s1*32  \clef "bass"
  r8 es r4 es-. r | es4. 8 r2 | r8 c r4 c-. r | c4. 8 r2 | 
  r8 d r4 d-. r | g4. 8 r2 |  r8 c, r4 c-. r | f4. 8 r f4.
  r8 as, r4 as-. r | as4. 8 r2 |  r8 as r4 as-. r | as4. 8 r2 |
  r8 as r4 as-. r | as4. 8 r2 |  r8 as r4 as-. r | r8 f'\bendAfter #-5 r4 f,-. f-.
}


grille = \chordmode {
  \bar "[|:"
 
  \bar ".." }

marques = \relative c' { 
  s1 % ^\markup \bold \box \fontsize #7 A s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 B s1*7 
  %   s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
        \new Staff << \chordsRhythm \\ \Basse >>
      >>
    } \form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } \form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
         \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >> 
      >>
    } \form
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }
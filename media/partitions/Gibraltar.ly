
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

title = #"Gibraltar"
composer = #"Freddie Hubbard"
meter = #"(Fast Latin Rock)"
kwtempo = #"Fast"
kwstyle = #"Latin Rock"

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
  asplayed = #"Freddie Hubbard" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=XvRfgbm-sNA"
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
%   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
%              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
%   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s2. g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f:7 
  g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f2:7 bes:13
   es1:7+ a:7 as:13 d:9+ g:m7 f:7 g:m7 f:7 s
   a1*4:7sus4 c:7sus4 es:7sus4 fis1*3:7sus4 d1:9+
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \mark \markup \bold { \box A Latin }
  \partial 4*3 g4-^bes8( d4-.) c8->~
  \repeat volta 2 { 
    \Segno 
    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 g4-^bes8( d4-.) c8->~ \break
    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 f8( g bes c d f) \bar "||" \break
    
  \mark \markup \bold Swing g4. f8 es( d4-.) cis8~ | cis2. c8( bes) |
  f'4. f8 es( f4-.) c8~ | c4. bes8 \times 2/3 { c16( des c } bes8 g f) |
  \mark \markup \bold  Latin 
  g1~ | 1~ |2 r }
  \alternative {
    { r4 g4-^bes8( d4-.) c8-> \laissezVibrer }
    { R1 \bar "||" \break }
  }
  \B d,2. d4( | f2 g) | g4.( d8~ d2~ | d1) | f2. f4( | as2 bes) | bes4. f8~ f2~ | f2. f4( | \break
  as2.) as4( b2 des) | des4.( as8~ as2 | as2.) as4 | b2. b4( | d2 e) | e b4. c8~ | c4 g4-^bes8( d4-.) c8->~ \break
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score.RehearsalMark.direction = #DOWN
    \mark \markup { \bold \with-color #(x11-color 'red) "D.S. al 2nd ending, Solos AABA" }
  \bar ".."
}

harmoniesII = \chordmode {
  \set chordChanges = ##t
  s2. g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f:7 
  g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f2:7 bes:13
   es1:7+ a:7 as:13 d:9+ g:m7 f:7 g:m7 f:7 s
   a1*4:7sus4 c:7sus4 es:7sus4 fis1*3:7sus4 d1:9+
   g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f:7 
  g1:m7 f:7 g:m7 f:7 g:m7 f:7 g:m7 f2:7 bes:13
   es1:7+ a:7 as:13 d:9+ g:m7 f:7 g:m7 f:7
}


theNotesII =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
  \mark \markup \bold { \box A Latin }
  \partial 4*3 g4-^bes8( d4-.) c8->~
  \repeat volta 2 { 
    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 g4-^bes8( d4-.) c8->~ \break
    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 f8( g bes c d f) \bar "||" \break
    
  \mark \markup \bold Swing g4. f8 es( d4-.) cis8~ | cis2. c8( bes) |
  f'4. f8 es( f4-.) c8~ | c4. bes8 \times 2/3 { c16( des c } bes8 g f) |
  \mark \markup \bold  Latin 
  g1~ | 1~ |2 r }
  \alternative {
    { r4 g4-^bes8( d4-.) c8-> \laissezVibrer }
    { R1 \bar "||" \break }
  }
  \B d,2. d4( | f2 g) | g4.( d8~ d2~ | d1) | f2. f4( | as2 bes) | bes4. f8~ f2~ | f2. f4( | \break
  as2.) as4( b2 des) | des4.( as8~ as2 | as2.) as4 | b2. b4( | d2 e) | e b4. c8~ | c4 g4-^bes8( d4-.) c8->~ \break
  \bar "||" \A

    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 g4-^bes8( d4-.) c8->~ \break
    c1~ | 1~ | 1~ | 4 g8( a bes c d bes | 
    c a f d~ d2~) | d1~ | 1~ | 4 f8( g bes c d f) \bar "||" \break
    
  \mark \markup \bold Swing g4. f8 es( d4-.) cis8~ | cis2. c8( bes) |
  f'4. f8 es( f4-.) c8~ | c4. bes8 \times 2/3 { c16( des c } bes8 g f) |
  \mark \markup \bold  Latin 
  g1~ | 1~ |2 r R1
  
\bar ".."
}


chordsRhythm = \relative c''' {
\override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
   g1:m7 f:7 g:m7 f:7 \break
   g1:m7 f:7 g:m7 f:7 \break
   g1:m7 f:7 g:m7 f:7 \break
   g1:m7 f:7 g:m7 \/f2:7 bes:13\break
   es1:7+ a:7 as:13 d:9+ \break
   g1:m7 f:7 g:m7 f:7 \bar ":|]"
   \repeat percent 4 a:7sus4 \break
   \repeat percent 4 c:7sus4 \break
   \repeat percent 4 es:7sus4 \break
   \repeat percent 3 fis:7sus4 d:9+ %\break
   \repeat volta 2 { 
     g1:m7 f:7 g:m7 f:7 \break
     g1:m7 f:7 g:m7 f:7  }
     es1:7+ a:7 as:13 d:9+ \break
   g1:m7 f:7 g:m7 f:7 \bar ".."
  }

marques = \relative c' { 
  s1  ^\markup \bold \fontsize #4 { \box A Latin } s1*15 
  s1 ^\markup \bold \fontsize #4 Swing s1*3 
  s1 ^\markup \bold \fontsize #4 Latin s1*3 
  s1  ^\markup \bold \fontsize #4 \box B
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
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
        \new ChordNames { \harmoniesII }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotesII
        >> 
      >>
    } %\form
    }  \bookpart {
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
        \new ChordNames { \transpose c d \harmoniesII } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotesII
        >> 
      >>
    } %\form
    }  \bookpart {
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
        \new ChordNames { \transpose c a \harmoniesII }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotesII
        >> 
      >>
    } %\form
    }  \bookpart {
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
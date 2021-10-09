
\version "2.22.0"
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

title = #"Invitation"
composer = #"B. Kaper and P. F. Webster"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
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
  c1*5:m9 f1:13 bes1*2:13
  es1*5:m9 as1:13 des1*2:13
  cis1.:m9 fis2:5+9- b1*3:m9 b2:m9 e:5+9- a1*2:m9
  a1.:m9 d2:5+9- g1*2:m9 es:11+ d1:9- g2:5+7 g:7
  c1*5:m9 f1:13 bes1*2:13
  es1*2:m9 b:11+ f1:9+ bes:9+ es1:m7+ 
  \startParenthesis \parenthesize d2:7 \endParenthesis \parenthesize  g2:7
}
harmoniesS = \chordmode {
  c1*5:m f1:9+ bes1*2:11+
  es1*5:m a1:9+ des1*2:11+
  des1.:m ges2:7 b1*3:m b2:m e:7 a1*2:m
  a1.:m d2:7 g1*2:m es:11+ d1:9+ g:9+
  c1*5:m9 f1:13 bes1*2:13
  es1*2:m9 b:11+ f1:9+ bes:9+ es1:m7+ 
  \startParenthesis \parenthesize d2:m7 \endParenthesis \parenthesize  g2:7
}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \A
  \times 2/3 { d4 es d' } a2 ~ | a4 g8 bes a g4 c,8 | d2 d ~ | d  \times 2/3 { d4 c g' } 
  d2 \times 2/3 { d4 c g' }  | d2. c4 | g'1 ~ | g2. r4  \break
  \times 2/3 { f4 ges f' } c2 ~ | c4 bes8 des c bes4 es,8 | f2 f ~ | f  \times 2/3 { f4 es bes' } 
  f2  \times 2/3 { f4 es bes' } | f2. es4 | bes'1 ~ | bes2. a4 \bar "||" \break
  \B
  \times 2/3 { gis4 b cis } dis2 ~ | dis4 gis,8 dis' d4 g,8 d' | cis2 cis ~ | cis1
  \times 2/3 { fis,4 a b } cis2 ~ | cis4 fis,8 cis' c4 f,8 c' | b1 ~ | b2. e,4  \break
  \times 2/3 { e4 g a } b2 ~ | b4 e,8 b' bes4 es,8 bes' | a2  a ~ | a4 g a bes
  a1 ~ \times 2/3 { a4 c a }  \times 2/3 { c a c, } | es1 ~ | es2. f4 \bar "||" \break
  \A
  \times 2/3 { d4 es d' } a2 ~ | a4 g8 bes a g4 c,8 | d2 d ~ | d  \times 2/3 { d4 c g' } 
  d4. 8 \times 2/3 { d4 c g' }  | d2. c4 | g'1 ~ | g2. r4  \break
  \times 2/3 { f4 ges f' } c2 ~ | c4 bes8 des c bes4 es,8 | f2 f ~ | f  \times 2/3 { es4 f es }
  as2 \times 2/3 { ges4 as ges } | cis4. b8 \times 2/3 { b4 cis b } | d1 | R1
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
  \repeat percent 4 c1:m9 \break
  \repeat percent 2 c:m9 f:13 bes:13 \break
  \repeat percent 4 es:m9 \break
  \repeat percent 2 es:m9 as:13 des:13 \break
  cis:m9 \/cis2:m9 fis:5+9- \repeat percent 2 b1:m9 \break
  b:m9 \/b2:m9 e:5+9- \repeat percent 2 a1:m9 \break
  a:m9 \/b2:m9 d:5+9- \repeat percent 2 g1:m9 \break
  \repeat percent 2 es:11+ d:9- \/g2:5+7 g:7
  \repeat percent 4 c1:m9 \break
  \repeat percent 2 c:m9 f:13 bes:13 \break
  \repeat percent 2 es:m9 \repeat percent 2 b:11+ \break
  f:9+ bes:9+ es:m7+ \/d2:7 g:7

  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  You and your smile hold a strange in -- vi -- ta -- tion
  Some -- how it seems
  We've shed our dream but we're
  Time af -- ter time in a room full of stran -- gers
  Out of the blue, sud -- den -- ly you were there

  Wher -- e -- ver I go you're the glow of temp -- ta -- tion,
  Glan -- cing my way in the grey of the dawn
  And al -- ways your smile holds that strange in -- vi -- ta -- tion
  Then you are gone
  Where oh where have you gone

  How long must I live in a world of il -- lu -- sion
  Be where you are so near yet so far, a -- part
  Ho -- ping you'll say with a sweet in -- vi -- ta -- tion
  Where have you been? dar -- ling come in
  Come in -- to my heart
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
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
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
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
          \addlyrics \verse
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
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
          \addlyrics \verse
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

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
